from django.conf import settings
from django.conf.urls.static import static
from django.urls import path, include
from rest_framework.authtoken.views import obtain_auth_token
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView

from .views import RegistrationAPIView, LoginAPIView, LogoutAPIView, VerifyOTPView, ChangePasswordView, \
    UserProfileListCreateView, userProfileDetailView

urlpatterns = [
    # """"""""""""""""""""""""""" token Authentication  """"""""""""""""""""""
    path('api-token-auth/', obtain_auth_token, name='api_token_auth'),
    # ++++++++++++++++++++++++++++++++++++  Register, Login, Logout User  ++++++++++++++++++++++++++
    path('register/', RegistrationAPIView.as_view(), name="register"),
    path('users/login/', LoginAPIView.as_view(), name="login"),  # Login after otp verification
    path('logout/', LogoutAPIView.as_view(), name="logout"),

    # +++++++++++++++++++++++++++++++++ Verify OTP Below    ++++++++++++++++++++++++++++++++++++++
    path('verify', VerifyOTPView.as_view(), name="verify"),  # otp Verify

    # path('forgot', ForgotPasswordView.as_view(), name='forgot-password'),  # forgot Password
    # path('reset', ResetPasswordView.as_view(), name='reset-password'),  # Resetting the Password after Login
    # """""""""""""""""""""""""""""""""""   Simple-Jwt Below   """""""""""""""""""""""""""""""""""
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),

    #     """"""""""""""""""""   Change Password  """"""""""""""""""""""""""""""""""""
    path('api/change-password/', ChangePasswordView.as_view(), name='change-password'),
    #     """"""""""""""""""""  Password Resset  """"""""""""""""""""""""""""""""""""
    path('api/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),
    # http://127.0.0.1:8000/api/password_reset/confirm/     # password confirmation url

    # """""""""""""   User Profile EndPoints    """"""""""""""""""""""""""""""""
    #  """"""""""""""""""""""  Profile  List User    """""""""""""""""""""""""""""""""
    # gets all user profiles and create a new profile
    path("all-profiles", UserProfileListCreateView.as_view(), name="all-profiles"),
    # retrieves profile details of the currently logged in user
    path("profile/<int:pk>", userProfileDetailView.as_view(), name="profile"),
    path("users/me", userProfileDetailView.as_view(), name="users"),
    path("users/me", userProfileDetailView.as_view(), name="users"),

    # path('users/', views.UserList.as_view(), name="users"),  # List All Users
    # path('users/detailview/', DetailAPIView.as_view(), name="detailview"),  # get  a specific User Details
    # path('api/change-password/', ChangePasswordView.as_view(), name='change-password'),
    # path('api/password_reset/', include('django_rest_passwordreset.urls', namespace='password_reset')),
]

urlpatterns = format_suffix_patterns(urlpatterns)
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
