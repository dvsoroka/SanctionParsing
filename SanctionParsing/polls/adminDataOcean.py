from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

#from users.models import DataOceanUser, Question



from django.contrib import admin
#from SanctionsParsing.polls.models import Author

#class AuthorAdmin(admin.ModelAdmin):
#    pass
#admin.site.register(Author, AuthorAdmin)




class DataOceanUserCreationForm(UserCreationForm):
    class Meta(UserCreationForm):
        model = DataOceanUser
        fields = ('last_name', 'first_name', 'email',)


class DataOceanUserChangeForm(UserChangeForm):
    class Meta:
        model = DataOceanUser
        fields = ('last_name', 'first_name', 'email',)


@admin.register(DataOceanUser)
class DataOceanUserAdmin(UserAdmin):
    add_form = DataOceanUserCreationForm
    form = DataOceanUserChangeForm
    list_display = ('last_name', 'first_name', 'email', 'date_joined', 'last_login', 'date_of_birth', 'organization',
                    'language', 'is_staff', 'is_active')
    list_filter = ('date_joined', 'last_login', 'date_of_birth', 'language', 'is_staff', 'is_active', 'is_superuser')
    fieldsets = (
        (None, {'fields': ('id', 'last_name', 'first_name', 'email', 'date_joined', 'last_login', 'date_of_birth',
                           'organization', 'position', 'language', 'password')}),
        ('Permissions', {'fields': ('is_staff', 'is_active', 'is_superuser')}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'password1', 'password2', 'is_staff', 'is_active')}
         ),
    )
    search_fields = ('last_name', 'first_name', 'email', 'organization')
    ordering = ('date_joined',)

    def has_change_permission(self, request, obj=None):
        return False

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False


@admin.register(Question)
class QuestionAdmin(admin.ModelAdmin):
    list_display = (
        'text',
        'user',
        'answered'
    )
    exclude = ('deleted_at',)
    list_filter = (
        'user',
        'answered',
        'created_at'
    )
    search_fields = ('text',)
    readonly_fields = (
        'text',
        'user'
    )
    ordering = ('created_at',)

    def has_add_permission(self, request):
        return False

    def has_delete_permission(self, request, obj=None):
        return False
