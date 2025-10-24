<?php

namespace Dev\GoogleMapsGeocoding\Forms\Settings;

use Dev\Base\Forms\FieldOptions\OnOffFieldOption;
use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\OnOffField;
use Dev\Base\Forms\Fields\TextField;
use Dev\Setting\Forms\SettingForm;
use Dev\GoogleMapsGeocoding\Http\Requests\Settings\GoogleMapsGeocodingSettingRequest;

class GoogleMapsGeocodingSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/google-maps-geocoding::geocoding.settings.title'))
            ->setSectionDescription(trans('plugins/google-maps-geocoding::geocoding.settings.description'))
            ->setValidatorClass(GoogleMapsGeocodingSettingRequest::class)
            ->add(
                'fob_google_maps_geocoding_api_key',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/google-maps-geocoding::geocoding.settings.api_key'))
                    ->placeholder(trans('plugins/google-maps-geocoding::geocoding.settings.api_key_placeholder'))
                    ->helperText(trans('plugins/google-maps-geocoding::geocoding.settings.api_key_helper'))
                    ->value(setting('fob_google_maps_geocoding_api_key'))
            )
            ->add(
                'fob_google_maps_geocoding_enabled',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/google-maps-geocoding::geocoding.settings.enabled'))
                    ->helperText(trans('plugins/google-maps-geocoding::geocoding.settings.enabled_helper'))
                    ->defaultValue(setting('fob_google_maps_geocoding_enabled', false))
            )
            ->add(
                'fob_google_maps_geocoding_auto_fill',
                OnOffField::class,
                OnOffFieldOption::make()
                    ->label(trans('plugins/google-maps-geocoding::geocoding.settings.auto_fill'))
                    ->helperText(trans('plugins/google-maps-geocoding::geocoding.settings.auto_fill_helper'))
                    ->defaultValue(setting('fob_google_maps_geocoding_auto_fill', true))
            );
    }
}
