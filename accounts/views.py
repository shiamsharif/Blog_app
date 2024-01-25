from django.contrib.auth.form import USerCreationForm
from django.urls import reverse_lazy
from django.views import generic



class SignUpView(generic.CreateView):
    form_class = USerCreationForm
    success_url = reverse_lazy('login')
    template_name = 'signup.html'