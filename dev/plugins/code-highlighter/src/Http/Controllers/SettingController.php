<?php

namespace Dev\CodeHighlighter\Http\Controllers;

use Dev\CodeHighlighter\Forms\CodeHighlighterSettingForm;
use Dev\Setting\Http\Controllers\SettingController as Controller;
use Dev\CodeHighlighter\Http\Requests\CodeHighlighterSettingRequest;

class SettingController extends Controller
{
    public function edit()
    {
        $this->pageTitle(trans('plugins/code-highlighter::code-highlighter.settings.title'));

        return CodeHighlighterSettingForm::create()->renderForm();
    }

    public function update(CodeHighlighterSettingRequest $request)
    {
        return $this->performUpdate($request->validated());
    }
}
