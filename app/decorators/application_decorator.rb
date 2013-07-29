require 'draper'
class ApplicationDecorator < Draper::Decorator
  delegate_all
  #   lazy_helpers

  # Shared Decorations
  #   Consider defining shared methods common to all your models.
  #
  #   Example: standardize the formatting of timestamps
  #
  #   def formatted_timestamp(time)
  #     h.content_tag :span, time.strftime("%a %m/%d/%y"),
  #                   :class => 'timestamp'
  #   end
  #
  #   def created_at
  #     formatted_timestamp(model.created_at)
  #   end
  #
  #   def updated_at
  #     formatted_timestamp(model.updated_at)
  #   end

  def as_json(options = {})
    model.as_json(options)
  end
end
