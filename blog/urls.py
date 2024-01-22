from django.urls import path

from .views import (
    BlogListView,
    BlogDetailView, 
    BlogCreateView,
    BlogUpdateView,
)

urlpatterns = [
    path('post/<int:pk>/edit', BlogUpdateView.as_view(), name='post_edit'), #newww
    path('post/new', BlogCreateView.as_view(), name='post_new'), #neww
    path('post/<int:pk>/', BlogDetailView.as_view(), name = 'post_detail'), #new
    path('', BlogListView.as_view(), name='home'),
]
