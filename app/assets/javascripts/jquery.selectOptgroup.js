jQuery.fn.selectOptgroup = function(options) {
	var settings = jQuery.extend({
		optSelect: '_options',
		inBetween: '',
		optBlank: null,
		selectBlank: null,
		keepOrphans: true,
		showSpeed: 200
	}, options);

	return this.each(function(){
		var select = jQuery(this);
		var optSelectID = this.id + settings.optSelect;
		var selectedOption = jQuery('option[selected]', select)
		if (selectedOption.length) {
			var selectedValue = selectedOption[0].value;
		} else {
			var selectedValue = null;
		}

		// Only if we have an id
		// Only if the opt select id doesn't exist already
		if (jQuery('#'+optSelectID).length) return;

		jQuery(this).before('<select id="'+optSelectID+'"></select>'+settings.inBetween);
		var optSelect = jQuery('#'+optSelectID);

		jQuery('label[for="'+this.id+'"]').attr('for', optSelectID);

		var optSelectSelected = null;
		var orphansCount = 0;
		if (settings.keepOrphans) {
			var orphans = jQuery('> option', this).each(function(i){
				var option = jQuery(this).clone()[0];
				option.options = jQuery(this);
				option.singleOption = true;
				optSelect.append(option);
				if (this.value == selectedValue && optSelectSelected == null) {
					optSelectSelected = i;
				}
			});
			orphansCount = orphans.length;
		}
		jQuery('optgroup', this).each(function(i){
			var option = jQuery('<option>'+this.label+'</option>')[0];
			option.options = jQuery('option', this);
			optSelect.append(option);
			option.options.each(function() {
				if (this.value == selectedValue && optSelectSelected == null) {
					optSelectSelected = i + orphansCount;
				}
			});
		});
		optSelect.change(function(){
			var option = this.options[this.selectedIndex];
			select.empty().append(option.options);
			if (settings.selectBlank != null && !option.singleOption) {
				jQuery('<option value="">'+settings.selectBlank+'</option>').prependTo(select)[0].singleOption = true;
			}
			if (option.singleOption) {
				select.hide()
			} else {
				select.show(settings.showSpeed)
				select[0].selectedIndex = 0;
				jQuery(option.options).each(function(i) {
					if (!select[0].selectedIndex && this.value == selectedValue) {
						select[0].selectedIndex = i;
						if (settings.selectBlank != null && !option.singleOption) {
							select[0].selectedIndex++;
						}
					}
				})
			}
		})
		if (settings.optBlank != null) {
			optSelect.prepend('<option value="">'+settings.optBlank+'</option>');
			if (optSelectSelected != null) {
				optSelectSelected++;
			}
		}
		if (optSelectSelected == null) {
			optSelectSelected = 0;
		}
		optSelect[0].selectedIndex = optSelectSelected;
		optSelect.change();
	});
}

$(document).ready(function() {
  $('.expand_optgroup').each(function(idx, o) {
    $(o).selectOptgroup();
  });
})
