from django.contrib import admin

from .models import User, UserProfile


# from django.contrib.auth.admin import  UserAdmin


class ProfileInline(admin.StackedInline):
    model = UserProfile
    max_num = 1
    can_delete = False
    verbose_name_plural = 'Profile'
    fk_name = 'user'


#
class UserAdmin(admin.ModelAdmin):
    """Define admin model for custom User model with no email field."""
    inlines = (ProfileInline,)

    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        ('Personal info', {'fields': ('first_name', 'last_name')}),
        ('Permissions', {'fields': ('is_active', 'is_staff', 'is_superuser', 'is_admin', 'is_used',
                                    'is_verified', 'groups', 'user_permissions', 'is_confirmed')}),
        ('Important dates', {'fields': ()}),
        ('Contact info', {'fields': ()}),)

    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password', 'password_confirmation'), }),)

    list_display = (
        'email', 'first_name', 'last_name', 'username','is_staff', 'is_used', 'is_verified', 'is_active', 'created_at',
        'updated_at')
    search_fields = ('email', 'first_name', 'last_name')
    ordering = ('email',)


admin.site.register(User, UserAdmin, )
# admin.site.unregister(User)
# admin.site.unregister(token_blacklist.models.OutstandingToken)
# admin.site.register(token_blacklist.models.OutstandingToken)
