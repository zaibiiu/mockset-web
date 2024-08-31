<div class="row">
    @foreach ($features as $feature)
        <div class="col-sm-6 col-md-4 col-lg-3 mb-3">
            <label class="checkbox-inline">
                <input name="features[]" type="checkbox" value="{{ $feature->id }}"
                       @if (in_array($feature->id, $selectedFeatures)) checked @endif>
                {{ $feature->name }}
            </label>
        </div>
    @endforeach
</div>

