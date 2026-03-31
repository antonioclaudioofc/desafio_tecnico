defmodule TodoLiveWeb.UI.Input do
  @moduledoc """
  Input customizado para o design system da aplicação.
  """
  use Phoenix.Component

  @doc """
  Componente de Input com Label e exibição de erros integrado ao Ecto.
  """
  attr(:id, :string, default: nil)
  attr(:name, :string, default: nil)
  attr(:label, :string, default: nil)
  attr(:value, :any, default: nil)
  attr(:type, :string, default: "text")
  attr(:field, Phoenix.HTML.FormField, doc: "Campo do formulário (Ecto)")
  attr(:errors, :list, default: [])
  attr(:rest, :global)

  def input(%{field: %Phoenix.HTML.FormField{} = field} = assigns) do
    assigns
    |> assign(field: nil)
    |> assign(:id, assigns[:id] || field.id)
    |> assign(:name, assigns[:name] || field.name)
    |> assign(:value, assigns[:value] || field.value)
    |> assign(:errors, field.errors ++ assigns.errors)
    |> input()
  end

  def input(assigns) do
    ~H"""
    <div class="flex flex-col gap-1.5 w-full">
      <label :if={@label} for={@id} class="text-sm font-semibold text-slate-700">
        {@label}
      </label>

      <%= if @type == "textarea" do %>
        <textarea
          id={@id}
          name={@name}
          aria-invalid={if @errors != [], do: "true", else: "false"}
          class={[
            "w-full px-3 py-2 border rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all",
            if(@errors != [], do: "border-red-500 bg-red-50", else: "border-slate-300")
          ]}
          {@rest}
        ><%= Phoenix.HTML.Form.normalize_value("textarea", @value) %></textarea>
      <% else %>
        <input
          type={@type}
          id={@id}
          name={@name}
          value={Phoenix.HTML.Form.normalize_value(@type, @value)}
          aria-invalid={if @errors != [], do: "true", else: "false"}
          class={[
            "w-full px-3 py-2 border rounded-md shadow-sm focus:ring-2 focus:ring-indigo-500 focus:border-indigo-500 outline-none transition-all",
            if(@errors != [], do: "border-red-500 bg-red-50", else: "border-slate-300")
          ]}
          {@rest}
        />
      <% end %>

      <p :for={error <- @errors} class="text-sm text-red-600 mt-0.5" role="alert">
        {translate_error(error)}
      </p>
    </div>
    """
  end

  defp translate_error({msg, opts}) do
    if count = opts[:count] do
      Gettext.dngettext(TodoLiveWeb.Gettext, "errors", msg, msg, count, opts)
    else
      Gettext.dgettext(TodoLiveWeb.Gettext, "errors", msg, opts)
    end
  end

  defp translate_error(msg) when is_binary(msg), do: msg
end
