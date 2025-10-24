@extends(BaseHelper::getAdminMasterLayoutTemplate())

@section('content')
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h4 class="card-title">{{ trans('plugins/barcode-generator::barcode-generator.templates.create') }}</h4>
                </div>
                <div class="card-body">
                    {!! $form->renderForm() !!}
                </div>
            </div>
        </div>
    </div>
@endsection
