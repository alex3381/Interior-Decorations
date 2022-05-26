from django.contrib import auth
from django.contrib.auth import authenticate
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import force_str
from django.utils.http import urlsafe_base64_decode
from django_countries.serializers import CountryFieldMixin
from rest_framework import serializers, request
from rest_framework.exceptions import AuthenticationFailed
from rest_framework_simplejwt.tokens import RefreshToken, TokenError

from .models import User, UserProfile


# """""""""""""""""""""""""""   User Profile Serializer  """""""""""""""""""""""""""""


#     +++++++++++++++++++++++++++++++   Register User Below   +++++++++++++++++++++++++++++++++
class RegistrationSerializer(serializers.ModelSerializer):
    # created_at = serializers.DateTimeField(format="%d-%m-%Y", read_only=True)
    # updated_at = serializers.DateTimeField(format="%d-%m-%Y", read_only=True)
    password = serializers.CharField(
        max_length=128,
        min_length=8,
        write_only=True
    )
    password_confirmation = serializers.CharField(
        max_length=128,
        min_length=8,
        write_only=True
    )
    username = serializers.CharField(required=False)

    class Meta:
        model = User

        fields = ['email',
                  'username',

                  'password',
                  'password_confirmation',
                  'first_name', 'last_name',
                  # 'created_at', 'updated_at', 'pk', 'id'
                  ]
        extra_kwargs = {
            'first_name': {'required': True},
            'last_name': {'required': True}
        }

    def validate(self, attrs):
        if attrs['password'] != attrs['password_confirmation']:
            raise serializers.ValidationError({"password": "Password fields didn't match."})

        return attrs

    def validate(self, attrs):
        email = attrs.get('email', '')
        if User.objects.filter(email=email).exists():
            raise serializers.ValidationError(
                {'email': ('Email is already in use')})
        return super().validate(attrs)

    def create(self, validated_data):
        user = User.objects.create_user(
            first_name=validated_data['first_name'],
            last_name=validated_data['last_name'],
            email=validated_data['email'],
            password=validated_data['password'],
            username=validated_data['username']
        )

        user.save()
        return user


# +++++++++++++++++++++    Login Below    ++++++++++++++++++++++++++++++
class LoginSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(max_length=255, min_length=3)
    password = serializers.CharField(
        max_length=68, min_length=6, write_only=True)
    username = serializers.CharField(
        max_length=255, min_length=3, read_only=True)

    tokens = serializers.SerializerMethodField()

    class Meta:
        model = User
        fields = ['email', 'username', 'password', 'tokens']

    def get_tokens(self, obj):
        user = User.objects.get(email=obj['email'])

        return {
            'refresh': user.tokens()['refresh'],
            'access': user.tokens()['access']
        }

    def validate(self, attrs):
        email = attrs.get('email', '')
        password = attrs.get('password', '')
        filtered_user_by_email = User.objects.filter(email=email)
        # user = auth.authenticate(email=email, password=password)

        user = authenticate(request, email=email, password=password)
        if filtered_user_by_email.exists() and filtered_user_by_email[0].auth_provider != 'email':
            raise AuthenticationFailed(
                detail='Please continue your login using ' + filtered_user_by_email[0].auth_provider)

        if not user:
            raise AuthenticationFailed('Invalid credentials, try again')
        if not user.is_active:
            raise AuthenticationFailed('Account disabled, contact admin')
        if not user.is_verified:
            raise AuthenticationFailed('Email is not verified')
        if not user.is_confirmed:
            raise AuthenticationFailed('please register to access account')

        return {
            'email': user.email,
            'username': user.username,
            'token': user.tokens
        }

    # return super().validate(attrs)


# """"""""""""""""""""""""""""""""""    Logout Below    """"""""""""""""""""""""""""""""""""""""""""""""""""""

class LogoutSerializer(serializers.Serializer):
    refresh = serializers.CharField()

    default_error_message = {
        'bad_token': 'Token is expired or invalid'
    }

    def validate(self, attrs):
        self.token = attrs['refresh']
        return attrs

    def save(self, **kwargs):

        try:
            RefreshToken(self.token).blacklist()

        except TokenError:
            self.fail('bad_token')


# '''''''''''''''''''''''''''''''''''   Verify OTP    ''''''''''''''''''''''''''''''''''


class VerifyOTPSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = [
            'otp',
            'email'
        ]


# """""""""""""""""""   Change Password Below   """""""""""""""""""""""""""""""""""""""


class ChangePasswordSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('new_password', 'password_confirmation', 'old_password')

    """
    Serializer for password change endpoint.
    """
    old_password = serializers.CharField(required=True)
    new_password = serializers.CharField(required=True)
    password_confirmation = serializers.CharField(required=True)


# '''"""""""""""""""""""""Reset Password    """""""""""""""""""""""""""""""""
class ResetPasswordRequestSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(min_length=2)

    class Meta:
        fields = ['email']

    # def validate(self, attrs):
    #     try:
    #         password = attrs.get('password')
    #         token = attrs.get('token')
    #         uidb64 = attrs.get('uidb64')
    #
    #         email = force_str(urlsafe_base64_decode(uidb64))
    #         user = User.objects.get(email=email)
    #         if not PasswordResetTokenGenerator().check_token(user, token):
    #             raise AuthenticationFailed('The reset link is invalid', 401)
    #
    #         user.set_password(password)
    #         user.save()
    #
    #         return (user)
    #     except Exception as e:
    #         raise AuthenticationFailed('The reset link is invalid', 401)
    #     return super().validate(attrs)


class SetNewPasswordSerializer(serializers.Serializer):
    password = serializers.CharField(
        min_length=6, max_length=68, write_only=True)
    token = serializers.CharField(
        min_length=1, write_only=True)
    uidb64 = serializers.CharField(
        min_length=1, write_only=True)

    class Meta:
        fields = ['password', 'token', 'uidb64']

    def validate(self, attrs):
        try:
            password = attrs.get('password')
            token = attrs.get('token')
            uidb64 = attrs.get('uidb64')

            user_id= force_str(urlsafe_base64_decode(uidb64))
            user = User.objects.get(user_id=user_id)
            if not PasswordResetTokenGenerator().check_token(user, token):
                raise AuthenticationFailed('The reset link is invalid', 401)

            user.set_password(password)
            user.save()

            return (user)
        except Exception as e:
            raise AuthenticationFailed('The reset link is invalid', 401)
            return super().validate(attrs)


# """""""""""""""""""""  UserProfile Serializer     """""""""""""""""""""""""
class UserProfileSerializer(CountryFieldMixin, serializers.ModelSerializer):
    user = serializers.StringRelatedField(read_only=True, )

    class Meta:
        model = UserProfile
        fields = '__all__'
