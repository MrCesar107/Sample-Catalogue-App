# frozen_string_literal: true

class Catalogues # :nodoc:
  attr_reader :status

  def initialize(status)
    @status = status
  end

  def catalogues
    status.eql?('active') && Catalogue.active || Catalogue.inactive
  end
end
