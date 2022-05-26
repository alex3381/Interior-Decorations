import uuid

from django.contrib.auth.models import (
    AbstractBaseUser, BaseUserManager, PermissionsMixin)
from django.core.mail import send_mail
from django.db import models
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from django_countries.fields import CountryField
from django_rest_passwordreset.signals import reset_password_token_created
from phonenumber_field.modelfields import PhoneNumberField
from rest_framework_simplejwt.tokens import RefreshToken
# """"""""""""  password Reset  """"""""""""""
from django.dispatch import receiver
from django.urls import reverse
from django_rest_passwordreset.signals import reset_password_token_created
from django.core.mail import send_mail


class UserManager(BaseUserManager):

    def create_user(self, email, username, first_name, last_name, password=None, **kwargs):

        if username is None:
            raise TypeError('Users must have a username.')

        if not email:
            raise ValueError("User must have an email")
        if not password:
            raise ValueError("User must have a password")

        user = self.model(username=username, first_name=first_name, last_name=last_name,
                          email=self.normalize_email(email))

        user.set_password(password)
        user.save()

        return user

    def create_superuser(self, email, username, first_name, last_name, password):
        if not email:
            raise ValueError("User must have an email")
        if not password:
            raise ValueError("SuperUser must have a password")

        user = self.create_user(email, username=username, first_name=first_name, last_name=last_name, password=password)
        user.set_password(password)  # change password to hash
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)
        return user


AUTH_PROVIDERS = {'facebook': 'facebook', 'google': 'google',
                  'twitter': 'twitter', 'email': 'email'}


class TimestampedModel(models.Model):
    # A timestamp representing when this object was created.
    created_at = models.DateTimeField(auto_now_add=True)

    # A timestamp reprensenting when this object was last updated.
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

        # By default, any model that inherits from `TimestampedModel` should
        # be ordered in reverse-chronological order. We can override this on a
        # per-model basis as needed, but reverse-chronological is a good
        # default ordering for most models.
        ordering = ['-created_at', '-updated_at']


class User(AbstractBaseUser, PermissionsMixin, TimestampedModel):
    username = models.CharField(db_index=True, max_length=255, unique=True)
    user_id = models.CharField(primary_key=True, default=uuid.uuid4, blank=False, unique=True, editable=False,
                               max_length=500, name=("user_id"), verbose_name=("User ID"))

    email = models.EmailField(db_index=True, unique=True)
    first_name = models.CharField(max_length=255, blank=False)
    last_name = models.CharField(max_length=255, blank=False)
    is_confirmed = models.BooleanField(default=False)  # default is True when not using otp email verification
    is_active = models.BooleanField('active', default=True)
    is_admin = models.BooleanField('admin', default=False)
    is_staff = models.BooleanField(default=False)
    otp = models.IntegerField(editable=False, default=False)  # storing otp
    is_used = models.BooleanField(default=False)  # it becomes true when otp stored in db is already used
    password_confirmation = models.CharField("password_confirmation", max_length=30, blank=False)
    is_verified = models.BooleanField(default=False)
    auth_provider = models.CharField(max_length=255, blank=False, null=False, default=AUTH_PROVIDERS.get('email'))

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username', 'first_name', 'last_name']

    objects = UserManager()

    def __str__(self):
        return self.email

    def tokens(self):
        refresh = RefreshToken.for_user(self)
        return {
            'refresh': str(refresh),
            'access': str(refresh.access_token)
        }


class UserProfile(TimestampedModel):
    user = models.OneToOneField(User, on_delete=models.CASCADE,
                                related_name='profile',
                                blank=True,
                                null=True,
                                )

    title = models.CharField(max_length=5,
                             choices=[('Mr', 'Mr'), ('Ms', 'Ms'), ('Mrs', 'Mrs'), ('Dr', 'Dr'), ('NA', '')],
                             default='NA')
    gender = models.CharField(max_length=1, choices=(('M', 'Male'), ('F', 'Female')), blank=True)
    age = models.PositiveIntegerField(blank=True, null=True)
    address = models.CharField(max_length=255, blank=True)
    city = models.CharField(max_length=50, blank=True)
    zip_code = models.CharField(max_length=5, )
    description = models.TextField(max_length=250, default='')
    fax_number = PhoneNumberField(blank=True)
    phone_number = PhoneNumberField()

    middle_name = models.CharField(max_length=100, blank=True)
    date_of_birth = models.DateField(auto_now=True)
    image = models.ImageField('profile picture', upload_to='templates/media/', null=True, blank=True)
    avatar = models.FileField(upload_to='templates/media', blank=True, default='')
    country = CountryField()

    def __str__(self):
        return self.user.email


@receiver(post_save, sender=User)
def create_user_profile(sender, instance, created, **kwargs):
    if created:
        UserProfile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_user_profile(sender, instance, **kwargs):
    instance.profile.save()


def __str__(self):
    return "{}".format(self.email)


# """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
# """""""""""""""""""""""""""""""""""""""""""""  Change Password  Signal  """"""""""""""""""""""


# """"""""""""""""""""""    Password Reset  """"""""""""""""""""""""""""""""""


@receiver(reset_password_token_created)
def password_reset_token_created(sender, instance, reset_password_token, *args, **kwargs):
    email_plaintext_message = "{}?token={}".format(reverse('password_reset:reset-password-request'),
                                                   reset_password_token.key)

    send_mail(
        # title:
        "Password Reset for {title}".format(title="Some website title"),
        # message:
        email_plaintext_message,
        # from:
        "noreply@somehost.local",
        # to:
        [reset_password_token.user.email]
    )
