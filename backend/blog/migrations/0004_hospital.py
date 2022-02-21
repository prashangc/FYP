# Generated by Django 4.0.2 on 2022-02-18 04:11

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('blog', '0003_medicalnewsimageslider_delete_medicalnewsimage'),
    ]

    operations = [
        migrations.CreateModel(
            name='Hospital',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('hospital_names', models.CharField(max_length=100)),
                ('hospital_images', models.ImageField(blank=True, upload_to='hospitals')),
            ],
        ),
    ]
