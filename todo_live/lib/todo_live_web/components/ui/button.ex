defmodule TodoLiveWeb.UI.Button do
  @moduledoc """
  Botão customizado para o design system da aplicação.
  """
  use Phoenix.Component

  @doc """
  Componente de Botão com suporte a variantes e estados.
  """
  attr(:type, :string, default: "button")
  attr(:variant, :atom, values: [:primary, :secondary, :danger], default: :primary)
  attr(:disabled, :boolean, default: false)
  attr(:class, :string, default: nil)
  attr(:rest, :global, include: ~w(phx-click phx-submit navigate href patch))

  slot(:inner_block, required: true)

  def button(assigns) do
    ~H"""
    <button
      type={@type}
      disabled={@disabled}
      class={[
        "px-4 py-2 rounded-lg font-medium transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2 disabled:opacity-50 disabled:cursor-not-allowed",
        variant_class(@variant),
        @class
      ]}
      {@rest}
    >
      {render_slot(@inner_block)}
    </button>
    """
  end

  defp variant_class(:primary),
    do: "bg-indigo-600 text-white hover:bg-indigo-700 focus:ring-indigo-500"

  defp variant_class(:secondary),
    do: "bg-slate-200 text-slate-800 hover:bg-slate-300 focus:ring-slate-400"

  defp variant_class(:danger), do: "bg-red-600 text-white hover:bg-red-700 focus:ring-red-500"
end
