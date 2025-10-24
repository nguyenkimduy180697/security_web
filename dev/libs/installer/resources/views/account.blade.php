@extends('libs/installer::layouts.master')

@section(
    'pageTitle',
     trans(
         'libs/installer::installer.install_step_title',
         ['step' => 5, 'title' => trans('libs/installer::installer.createAccount.title')]
     )
)

@section('header')
    <x-core::card.title>
        {{ trans('libs/installer::installer.createAccount.title') }}
    </x-core::card.title>
@endsection

@section('content')
    <form
        id="create-account-form"
        method="post"
        action="{{ route('installers.accounts.store') }}"
    >
        @csrf
        <div class="row">
            <x-core::form.text-input
                wrapper-class="col-md-6"
                id="first_name"
                name="first_name"
                :label="trans('libs/installer::installer.createAccount.form.first_name')"
                :value="old('first_name')"
                :placeholder="trans('libs/installer::installer.createAccount.form.first_name')"
            />

            <x-core::form.text-input
                wrapper-class="col-md-6"
                id="last_name"
                name="last_name"
                :label="trans('libs/installer::installer.createAccount.form.last_name')"
                :value="old('last_name')"
                :placeholder="trans('libs/installer::installer.createAccount.form.last_name')"
            />

            <x-core::form.text-input
                wrapper-class="col-md-6"
                id="username"
                name="username"
                :label="trans('libs/installer::installer.createAccount.form.username')"
                :value="old('username')"
                :placeholder="trans('libs/installer::installer.createAccount.form.username')"
            />

            <x-core::form.text-input
                wrapper-class="col-md-6"
                id="email"
                name="email"
                type="email"
                :label="trans('libs/installer::installer.createAccount.form.email')"
                :value="old('email')"
                :placeholder="trans('libs/installer::installer.createAccount.form.email')"
            />

            <x-core::form.text-input
                wrapper-class="col-md-6"
                id="password"
                name="password"
                type="password"
                :label="trans('libs/installer::installer.createAccount.form.password')"
                value="{{ old('password') }}"
                :placeholder="trans('libs/installer::installer.createAccount.form.password')"
            />

            <x-core::form.text-input
                wrapper-class="col-md-6"
                id="password_confirmation"
                name="password_confirmation"
                type="password"
                value="{{ old('password_confirmation') }}"
                :label="trans('libs/installer::installer.createAccount.form.password_confirmation')"
                :placeholder="trans('libs/installer::installer.createAccount.form.password_confirmation')"
            />
        </div>
    </form>

@endsection

@section('footer')
    <x-core::button
        color="primary"
        type="submit"
        form="create-account-form"
    >
        {{ trans('libs/installer::installer.createAccount.form.create') }}
    </x-core::button>
@endsection
