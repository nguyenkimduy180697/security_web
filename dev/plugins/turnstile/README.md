# Turnstile

A plugin implement Cloudflare's Turnstile feature into Laravel CMS.

Turnstile is a CAPTCHA alternative that is privacy-focused. It is designed to protect your website from spam and abuse while letting real people pass through with ease.

![Turnstile](./screenshot.png)

## Installation

### Requirements

* Dev core 7.2.6 or later.

### Install via Admin Panel

Go to the **Admin Panel** and click on the **Plugins** tab. Click on the **Add new** button, find the **Turnstile** plugin and click on the **Install** button.

### Install manually

1. Download the plugin from
   the [Laravel Marketplace](https://marketplace.fsofts.com/products/dev/turnstile).
2. Extract the downloaded file and upload the extracted folder to the `dev/plugins` directory.
3. Go to **Admin** > **Plugins** and click on the **Activate** button.

## Usage

![Demo](./art/demo.gif)

In admin panel, go to `Settings` -> `Others` -> `Turnstile` to configure the plugin.

To use Turnstile, you'll need to [generate a Turnstile token from Cloudflare](https://dash.cloudflare.com/sign-up?to=/:account/turnstile). After that, and paste the `Site Key` and `Secret Key` into the plugin settings.

![Settings](./art/settings.png)

In the settings page, you can also configure which forms to enable Turnstile on.

### Supported Forms

Currently, the plugin supports the following forms:

- Contact form
- Newsletter form
- Member:
  - Login form
  - Register form
  - Forgot password form
  - Reset password form
- Admin:
  - Login form
  - Forgot password form
  - Reset password form

You can request support for more forms by creating an issue on the [GitHub repository](../../issues).

## Contributing

Please see [CONTRIBUTING](CONTRIBUTING.md) for details.

## Security

If you discover any security related issues, please email dev@gmail.com instead of using the issue tracker.

## Credits

* [Friends Of Core](https://github.com/FriendsOfCore)
* [All Contributors](../../contributors)

## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
