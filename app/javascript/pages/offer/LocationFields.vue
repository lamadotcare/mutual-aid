<template>
  <div>
    <!-- TODO: this is too many fields! -->
    <b-field :label-for="withPrefix('street_address')" label="Street address">
      <b-input :name="withPrefix('street_address')" :value="street_address" />
    </b-field>

    <b-field :label-for="withPrefix('neighborhood')" label="Neighborhood">
      <b-input :name="withPrefix('neighborhood')" :value="neighborhood" />
    </b-field>

    <b-field :label-for="withPrefix('city')" label="City">
      <b-input :name="withPrefix('city')" :value="city" />
    </b-field>

    <b-field :label-for="withPrefix('county')" label="County">
      <b-input :name="withPrefix('county')" :value="county" />
    </b-field>

    <b-field :label-for="withPrefix('state')" label="State">
      <b-input :name="withPrefix('state')" :value="state" />
    </b-field>

    <b-field :label-for="zip" label="Zip">
      <b-input :name="withPrefix('zip')" :value="zip" />
    </b-field>

    <b-field :label-for="region" label="Region">
      <b-input :name="withPrefix('region')" :value="region" />
    </b-field>
  </div>
</template>

<script>
import {partial} from 'utils/function'
import {fieldNameWithPrefix} from 'utils/form'

export default {
  props: {
    fieldNamePrefix: String,
    street_address: String,
    neighborhood: String,
    city: String,
    county: String,
    state: String,
    zip: String,
    region: String,
  },
  created: function() {
    // TODO: tiny bit of duplication with partial+fieldNameWithPrefix
    this.withPrefix = partial(fieldNameWithPrefix, this.fieldNamePrefix)
  },
}
</script>
