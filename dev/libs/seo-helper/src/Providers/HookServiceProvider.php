<?php

namespace Dev\SeoHelper\Providers;

use Dev\Base\Contracts\BaseModel;
use Dev\Base\Facades\Assets;
use Dev\Base\Facades\BaseHelper;
use Dev\Base\Facades\MetaBox;
use Dev\Base\Supports\ServiceProvider;
use Dev\Media\Facades\AppMedia;
use Dev\Page\Models\Page;
use Dev\SeoHelper\Facades\SeoHelper;
use Dev\SeoHelper\Forms\SeoForm;
use Dev\Theme\Facades\ThemeOption;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Routing\Events\RouteMatched;

class HookServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        add_action(BASE_ACTION_META_BOXES, [$this, 'addMetaBox'], 12, 2);

        $this->app['events']->listen(RouteMatched::class, function (): void {
            add_action(BASE_ACTION_PUBLIC_RENDER_SINGLE, [$this, 'setSeoMeta'], 56, 2);
        });
    }

    public function addMetaBox(string $priority, array|string|BaseModel|null $data = null): void
    {
        if (
            $priority == 'advanced'
            && ! empty($data)
            && $data instanceof BaseModel
            && in_array($data::class, config('libs.seo-helper.general.supported', []))) {

            if ($data instanceof Page && BaseHelper::isHomepage($data->getKey())) {
                MetaBox::addMetaBox(
                    'seo_wrap',
                    trans('libs/seo-helper::seo-helper.meta_box_header'),
                    fn () => view('libs/seo-helper::homepage-meta-box')->render(),
                    $data::class,
                    'advanced',
                    'low'
                );

                return;
            }

            Assets::addScriptsDirectly('vendor/core/libs/seo-helper/js/seo-helper.js')
                ->addStylesDirectly('vendor/core/libs/seo-helper/css/seo-helper.css');

            MetaBox::addMetaBox(
                'seo_wrap',
                trans('libs/seo-helper::seo-helper.meta_box_header'),
                [$this, 'seoMetaBox'],
                $data::class,
                'advanced',
                'low'
            );
        }
    }

    public function seoMetaBox(): string
    {
        $meta = [
            'seo_title' => null,
            'seo_description' => null,
            'seo_image' => null,
            'index' => 'index',
        ];

        $args = func_get_args();
        if (! empty($args[0]) && $args[0]->id) {
            $metadata = MetaBox::getMetaData($args[0], 'seo_meta', true);
        }

        if (! empty($metadata) && is_array($metadata)) {
            $meta = array_merge($meta, $metadata);
        }

        $object = $args[0];

        $form = SeoForm::createFromArray($meta)->renderForm(showStart: false, showEnd: false);

        return view('libs/seo-helper::meta-box', compact('meta', 'object', 'form'))->render();
    }

    public function setSeoMeta(string $screen, BaseModel|Model|null $object): bool
    {
        SeoHelper::meta()->addMeta('robots', ThemeOption::getOption('seo_index', true) ? 'index, follow' : 'noindex, nofollow');

        if ($object instanceof Page && BaseHelper::isHomepage($object->getKey())) {
            return false;
        }

        $object->loadMissing('metadata');
        $meta = $object->getMetaData('seo_meta', true);

        if (! empty($meta)) {
            if (! empty($meta['seo_title'])) {
                SeoHelper::setTitle($meta['seo_title']);
            }

            if (! empty($meta['seo_description'])) {
                SeoHelper::setDescription($meta['seo_description']);
            }

            if (! empty($meta['seo_image'])) {
                SeoHelper::setImage(AppMedia::getImageUrl($meta['seo_image']));
            }

            if (! empty($meta['index'])) {
                SeoHelper::meta()->addMeta('robots', $meta['index'] === 'index' ? 'index, follow' : 'noindex, nofollow');
            }
        }

        $currentDescription = SeoHelper::getDescription();

        if (
            (! $currentDescription || $currentDescription === theme_option('seo_description'))
            && ($object->description || $object->content)
        ) {
            SeoHelper::setDescription($object->description ?: $object->content);
        }

        return true;
    }
}
