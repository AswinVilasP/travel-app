# Generated by Django 2.2.11 on 2020-03-24 11:43

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('travelapp', '0013_auto_20200323_2237'),
    ]

    operations = [
        migrations.AlterField(
            model_name='flights',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
        migrations.AlterField(
            model_name='hotels',
            name='id',
            field=models.AutoField(primary_key=True, serialize=False),
        ),
    ]