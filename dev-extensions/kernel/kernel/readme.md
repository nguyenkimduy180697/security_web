# AdvanceRole for Laravel CMS

- Bootstrap core system
- Initial some core packages
- Override some kernel and more

<p align="center">
    <a href="https://packagist.org/packages/vswb/advanced-role"><img src="https://img.shields.io/packagist/v/vswb/advanced-role.svg?style=flat-square" alt="Latest Version"></a>
    <a href="/LICENSE"><img src="https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square" alt="Software License"></a>
    <a href="https://packagist.org/packages/vswb/advanced-role"><img src="https://img.shields.io/packagist/dt/vswb/advanced-role.svg?style=flat-square" alt="Total Downloads"></a>
</p>

## Installation

You can install the package via composer:

```shell
composer require dev-extension/kernel
```

## Documentation

### Seeding data for app_permission

Override some default settings

```shell
php artisan db:seed --class=\\Dev\\Kernel\\Seeders\\SettingSeeder
```

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.

