# Generated by Django 4.0.1 on 2022-05-09 13:20

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django_countries.fields
import phonenumber_field.modelfields
import uuid


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('auth', '0012_alter_user_first_name_max_length'),
    ]

    operations = [
        migrations.CreateModel(
            name='User',
            fields=[
                ('password', models.CharField(max_length=128, verbose_name='password')),
                ('last_login', models.DateTimeField(blank=True, null=True, verbose_name='last login')),
                ('is_superuser', models.BooleanField(default=False, help_text='Designates that this user has all permissions without explicitly assigning them.', verbose_name='superuser status')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('username', models.CharField(db_index=True, max_length=255, unique=True)),
                ('user_id', models.CharField(default=uuid.uuid4, editable=False, max_length=500, primary_key=True, serialize=False, unique=True, verbose_name='User ID')),
                ('email', models.EmailField(db_index=True, max_length=254, unique=True)),
                ('first_name', models.CharField(max_length=255)),
                ('last_name', models.CharField(max_length=255)),
                ('is_confirmed', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True, verbose_name='active')),
                ('is_admin', models.BooleanField(default=False, verbose_name='admin')),
                ('is_staff', models.BooleanField(default=False)),
                ('otp', models.IntegerField(default=False, editable=False)),
                ('is_used', models.BooleanField(default=False)),
                ('password_confirmation', models.CharField(max_length=30, verbose_name='password_confirmation')),
                ('is_verified', models.BooleanField(default=False)),
                ('auth_provider', models.CharField(default='email', max_length=255)),
                ('groups', models.ManyToManyField(blank=True, help_text='The groups this user belongs to. A user will get all permissions granted to each of their groups.', related_name='user_set', related_query_name='user', to='auth.Group', verbose_name='groups')),
                ('user_permissions', models.ManyToManyField(blank=True, help_text='Specific permissions for this user.', related_name='user_set', related_query_name='user', to='auth.Permission', verbose_name='user permissions')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='UserProfile',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('title', models.CharField(choices=[('Mr', 'Mr'), ('Ms', 'Ms'), ('Mrs', 'Mrs'), ('Dr', 'Dr'), ('NA', '')], default='NA', max_length=5)),
                ('gender', models.CharField(blank=True, choices=[('M', 'Male'), ('F', 'Female')], max_length=1)),
                ('age', models.PositiveIntegerField(blank=True, null=True)),
                ('address', models.CharField(blank=True, max_length=255)),
                ('city', models.CharField(blank=True, max_length=50)),
                ('zip_code', models.CharField(max_length=5)),
                ('description', models.TextField(default='', max_length=250)),
                ('fax_number', phonenumber_field.modelfields.PhoneNumberField(blank=True, max_length=128, region=None)),
                ('phone_number', phonenumber_field.modelfields.PhoneNumberField(max_length=128, region=None)),
                ('middle_name', models.CharField(blank=True, max_length=100)),
                ('date_of_birth', models.DateField(auto_now=True)),
                ('image', models.ImageField(blank=True, null=True, upload_to='templates/media/', verbose_name='profile picture')),
                ('avatar', models.FileField(blank=True, default='', upload_to='templates/media')),
                ('country', django_countries.fields.CountryField(max_length=2)),
                ('user', models.OneToOneField(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, related_name='profile', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'ordering': ['-created_at', '-updated_at'],
                'abstract': False,
            },
        ),
    ]
