from django.db import models


class Quote(models.Model):
    text = models.TextField()
    author_name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"“{self.text}“ - {self.author_name}"
