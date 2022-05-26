# from .permissions import IsOwnerProfileOrReadOnly
import os
from email.mime.image import MIMEImage
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

import pyotp
from django import template
from django.conf import settings
from django.contrib.auth import get_user_model
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.contrib.sites.shortcuts import get_current_site
from django.core.mail import EmailMultiAlternatives
from django.http import HttpResponsePermanentRedirect
from django.template.loader import render_to_string
from django.utils.encoding import smart_bytes, DjangoUnicodeDecodeError, smart_str
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from rest_framework import generics, status, permissions
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView
from rest_framework.permissions import AllowAny, BasePermission
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.reverse import reverse
from rest_framework.views import APIView

from .models import UserProfile
from .permissions import IsOwnerProfileOrReadOnly, IsSuperUser, IsOwner
from .renderer import UserJSONRenderer
from .serializers import RegistrationSerializer, LoginSerializer, VerifyOTPSerializer, LogoutSerializer, \
    ChangePasswordSerializer, UserProfileSerializer, ResetPasswordRequestSerializer, SetNewPasswordSerializer
from .utils import Util

register = template.Library()

User = get_user_model()


class CustomRedirect(HttpResponsePermanentRedirect):
    allowed_schemes = [os.environ.get('APP_SCHEME'), 'http', 'https']


# ''''''''''''''''''''''''''''''''''''''   Verify OTP     '''''''''''''''''''''''''''''''''''''


def verifyOTP(one_time):
    answer = totp.verify(one_time)
    return answer


# """"""""""""""""""""""""""""""""""""    Verify OTP  Below   """""""""""""""""""""""""""""""""""
class VerifyOTPView(APIView):
    permission_classes = (AllowAny,)
    serializer_class = VerifyOTPSerializer

    def post(self, request):
        VerifyOTPSerializer(data=request.data)

        email = request.data['email']
        one_time = request.data['otp']
        print(one_time)
        # one_time = [int(a) for a in one_time]
        print('one_time_password', one_time)
        one = verifyOTP(one_time)
        print('one', one)
        if one:
            User.objects.filter(email=email).update(
                is_confirmed=True, is_used=True, is_verified=True, otp=one_time)
            return Response({'msg': 'OTP verification successful'}, status=status.HTTP_200_OK)
        else:
            return Response({'msg': 'OTP verification Failed'}, status=status.HTTP_400_BAD_REQUEST)


# '''''''''''''''"""""""""""'""""""""""     Register New User    """""""""""""""""""""""""""""""""""


class RegistrationAPIView(APIView):
    # Allow any user (authenticated or not) to hit this endpoint.
    permission_classes = (AllowAny,)
    serializer_class = RegistrationSerializer
    renderer_classes = (UserJSONRenderer,)

    def get(self, request):
        return Response({'Status': 'You cannot view all users data.....'})

    def post(self, request, ):
        global subject
        global totp
        # user = request.data

        email = request.data['email']
        print(email)
        data = User.objects.filter(email=email)
        print('data ', data)

        if data.exists():
            return Response({'msg': 'Already registered'}, status=status.HTTP_409_CONFLICT)
        else:
            serializer = self.serializer_class(data=request.data)
            print("ser", serializer)
            first_name = request.data['first_name'],
            last_name = request.data['last_name']

        if serializer.is_valid(raise_exception=True):
            serializer.save(),
            print('i also got here')
            print(data)

            secret = pyotp.random_base32()
            # set interval(time of the otp expiration) according to your need in seconds.
            totp = pyotp.TOTP(secret, interval=300)
            one_time = totp.now()
            one_time = [int(a) for a in one_time]
            # one_time = one_time
            first_element = one_time[0]
            second_element = one_time[1]
            third_element = one_time[2]
            fourth_element = one_time[3]
            fifth_element = one_time[4]
            sixth_element = one_time[5]

            print(first_element)
            print(second_element)
            print(third_element)
            print(fourth_element)
            print(fifth_element)
            print(sixth_element)

            posts = [
                {'last_name': last_name,
                 'first_name': first_name,
                 'title': 'OTP Verification',
                 'content': 'Verify Your OTP To Access Your Account .',
                 'date_posted': 'October 26, 2021',
                 'first_element': first_element,
                 'second_element': second_element,
                 'third_element': third_element,
                 'fourth_element': fourth_element,
                 'fifth_element': fifth_element,
                 'sixth_element': sixth_element,
                 # 'token': token

                 },

            ]
            context = {'posts': posts}
            subject = "Signup Successful"
            to_email = [email]
            sender = settings.EMAIL_HOST_USER
            html_content = render_to_string(
                'C:\\Users\\Alex\\Desktop\\frontend_backend\\backend\\accounts\\templates\\arise.html',
                # 'C:\\Users\\Alex\Desktop\\frontend_backend\\user - account - credentials - and -autnetication - main\\accounts\\templates\\arise.html',
                # 'C:\\Users\\Alex\\Desktop\\fullstack\\backend\\accounts\\templates\\arise.html',
                context)
            text_content = render_to_string(
                'C:\\Users\\Alex\\Desktop\\frontend_backend\\backend\\accounts\\templates\\base.txt',
                context)
            img_data = open(
                'C:\\Users\\Alex\\Desktop\\fullstack\\backend\\accounts\\templates\\media\\email.png',
                'rb').read()
            html_part = MIMEMultipart(_subtype='related')
            body = MIMEText(html_content, _subtype='html')
            html_part.attach(body)
            img = MIMEImage(img_data, 'png')
            img.add_header('Content-Id', '<email.png>')
            img.add_header("Content-Disposition", "inline", filename="email.png")
            html_part.attach(img)
            msg = EmailMultiAlternatives(subject, None,
                                         sender, [email])
            msg.attach(html_part)
            msg.send()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response({"Error": "Sign Up Failed"}, status=status.HTTP_400_BAD_REQUEST)


# """"""""""""""""""""""""""  Login View Below   """"""""""""""""""""""""""""""""""
class LoginAPIView(generics.GenericAPIView):
    serializer_class = LoginSerializer
    permission_classes = (AllowAny,)
    renderer_classes = (UserJSONRenderer,)

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


# """""""""""""""""""""""""""""""""""""""""   Logout Below  """""""""""""""""""""""""""""""""""
class LogoutAPIView(generics.GenericAPIView):
    serializer_class = LogoutSerializer

    permission_classes = (permissions.IsAuthenticated,)

    def post(self, request):
        serializer = self.serializer_class(data=request.data)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(status=status.HTTP_204_NO_CONTENT)


# """""""""""""""""""""""""""""""   Change Password   Below  """""""""""""""""""""

class ChangePasswordView(generics.UpdateAPIView):
    """
    An endpoint for changing password.
    """
    serializer_class = ChangePasswordSerializer
    model = User
    permission_classes = (IsAuthenticated,)

    def get_object(self, queryset=None):
        obj = self.request.user
        return obj

    def update(self, request, *args, **kwargs):
        self.object = self.get_object()
        serializer = self.get_serializer(data=request.data)

        if serializer.is_valid():
            # Check old password
            if not self.object.check_password(serializer.data.get("old_password")):
                return Response({"old_password": ["Wrong password."]}, status=status.HTTP_400_BAD_REQUEST)
            # set_password also hashes the password that the user will get
            self.object.set_password(serializer.data.get("new_password"))
            self.object.save()
            response = {
                'status': 'success',
                'code': status.HTTP_200_OK,
                'message': 'Password updated successfully',
                'data': []
            }

            return Response(response)

        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


# """"""""""""""""  Password Rest   """""""""""
# third party app was used check url


#   """""""""""""""' end  """"""""""""""""""""


#   """"""""""""""   User Profile  List View  Get specific customer details   """""""""""""


class UserProfileListCreateView(ListCreateAPIView):
    # queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [IsAuthenticated, IsOwnerProfileOrReadOnly, ]

    def get_queryset(self):
        user = self.request.user

        return UserProfile.objects.filter(user_id=user)

    def perform_create(self, serializer):
        user = self.request.user
        print(serializer.data)
        serializer.save(user=user)


#   """"""""""""""""""""""""""""""  User  Profile Detail View, Update, Delete  """"""""""""""""""""""""""""""""
class userProfileDetailView(RetrieveUpdateDestroyAPIView):
    queryset = UserProfile.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [IsAuthenticated]
