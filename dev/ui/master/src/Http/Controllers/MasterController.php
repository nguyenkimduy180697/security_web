<?php

namespace Theme\Master\Http\Controllers;

use Dev\Base\Facades\BaseHelper;
use Dev\Blog\Repositories\Interfaces\PostInterface;
use Dev\Theme\Facades\Theme;
use Dev\Theme\Http\Controllers\PublicController;
use Illuminate\Http\Request;

class MasterController extends PublicController
{
    /**
     * Search post
     *
     * @bodyParam q string required The search keyword.
     *
     * @group Blog
     */
    public function getSearch(Request $request, PostInterface $postRepository)
    {
        $query = BaseHelper::stringify($request->input('q'));

        if (! empty($query)) {
            $posts = $postRepository->getSearch($query);

            $data = [
                'items' => Theme::partial('search', compact('posts')),
                'query' => $query,
                'count' => $posts->count(),
            ];

            if ($data['count'] > 0) {
                return $this
                    ->httpResponse()
                    ->setData(apply_filters(BASE_FILTER_SET_DATA_SEARCH, $data, 10, 1));
            }
        }

        return $this
            ->httpResponse()
            ->setError()
            ->setMessage(__('No results found, please try with different keywords.'));
    }
}
