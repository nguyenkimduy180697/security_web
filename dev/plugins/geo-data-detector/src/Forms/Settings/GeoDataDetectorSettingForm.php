<?php

namespace Dev\GeoDataDetector\Forms\Settings;

use Dev\Base\Forms\FieldOptions\TextFieldOption;
use Dev\Base\Forms\Fields\TextField;
use Dev\GeoDataDetector\Http\Requests\Settings\GeoDataDetectorSettingRequest;
use Dev\Base\Forms\FieldOptions\CheckboxFieldOption;
use Dev\Base\Forms\Fields\OnOffCheckboxField;
use Dev\Setting\Forms\SettingForm;

class GeoDataDetectorSettingForm extends SettingForm
{
    public function setup(): void
    {
        parent::setup();

        $this
            ->setSectionTitle(trans('plugins/geo-data-detector::geo-data-detector.name'))
            ->setSectionDescription(trans('plugins/geo-data-detector::geo-data-detector.description'))
            ->setValidatorClass(GeoDataDetectorSettingRequest::class)
            ->add(
                'fob_geo_data_detector_enabled',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/geo-data-detector::geo-data-detector.enable'))
                    ->value($CurrencyDetectorEnabled = setting('fob_geo_data_detector_enabled', false))
            )
            ->addOpenCollapsible('fob_geo_data_detector_enabled', '1', $CurrencyDetectorEnabled == '1')
            ->add(
                'fob_geo_data_detector_ipdata_api_key',
                TextField::class,
                TextFieldOption::make()
                    ->label(trans('plugins/geo-data-detector::geo-data-detector.api_key'))
                    ->helperText(trans('plugins/geo-data-detector::geo-data-detector.api_key_helper'))
                    ->value(setting('fob_geo_data_detector_ipdata_api_key'))
            )
            ->add(
                'fob_geo_data_currency_detector_enabled',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/geo-data-detector::geo-data-detector.currency_detector_enabled'))
                    ->helperText(trans('plugins/geo-data-detector::geo-data-detector.currency_detector_enabled_helper'))
                    ->value(setting('fob_geo_data_currency_detector_enabled', false))
            )
            ->add(
                'fob_geo_data_language_detector_enabled',
                OnOffCheckboxField::class,
                CheckboxFieldOption::make()
                    ->label(trans('plugins/geo-data-detector::geo-data-detector.language_detector_enabled'))
                    ->helperText(trans('plugins/geo-data-detector::geo-data-detector.language_detector_enabled_helper'))
                    ->value(setting('fob_geo_data_language_detector_enabled', false))
            )
            ->addCloseCollapsible('fob_geo_data_detector_enabled', '1');
    }
}
