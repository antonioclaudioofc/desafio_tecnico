defmodule TodoLiveWeb.UI.Card do
  @moduledoc """
  Card customizado para o design system da aplicação.
  """
  use Phoenix.Component

  @doc """
  Container de Card reutilizável.
  """
  attr(:class, :string, default: nil)
  slot(:header)
  slot(:inner_block, required: true)
  slot(:footer)

  def card(assigns) do
    ~H"""
    <div class={["bg-white border border-slate-200 rounded-xl shadow-sm overflow-hidden", @class]}>
      <div :if={@header != []} class="px-6 py-4 border-b border-slate-100 font-bold text-slate-800">
        {render_slot(@header)}
      </div>

      <div class="px-6 py-4 text-slate-600">
        {render_slot(@inner_block)}
      </div>

      <div :if={@footer != []} class="px-6 py-4 bg-slate-50 border-t border-slate-100">
        {render_slot(@footer)}
      </div>
    </div>
    """
  end
end
