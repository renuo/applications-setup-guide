# frozen_string_literal: true

module Rails
  class HealthController < ApplicationController
    rescue_from(Exception) { render_down }

    def show
      val = ActiveRecord::Base.connection.execute('select 1+2 as val').first['val']
      raise unless val.to_i == 3

      render_up
    end

    private

    def render_up
      render html: html_status(color: 'green')
    end

    def render_down
      render html: html_status(color: 'red'), status: :internal_server_error
    end

    def html_status(color:) # rubocop:disable Rails/OutputSafety
      %(<!DOCTYPE html><html><body style="background-color: #{color}"></body></html>).html_safe
    end
  end
end
