defmodule TodoLiveWeb.TaskLive.Index do
  use TodoLiveWeb, :live_view
  alias TodoLive.Tasks
  alias TodoLive.Tasks.Task

  @impl true
  def mount(_params, _session, socket) do
    tasks = Tasks.list_tasks()
    changeset = Tasks.change_task(%Task{})

    {:ok,
     socket
     |> assign(:tasks, tasks)
     |> assign_form(changeset)}
  end

  @impl true
  def handle_event("validate", %{"task" => task_params}, socket) do
    changeset =
      %Task{}
      |> Tasks.change_task(task_params)
      |> Map.put(:action, :validate)

    {:noreply, assign_form(socket, changeset)}
  end

  @impl true
  def handle_event("save", %{"task" => task_params}, socket) do
    case Tasks.create_task(task_params) do
      {:ok, _task} ->
        tasks = Tasks.list_tasks()
        changeset = Tasks.change_task(%Task{})

        {:noreply,
         socket
         |> put_flash(:info, "Tarefa criada com sucesso!")
         |> assign(:tasks, tasks)
         |> assign_form(changeset)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    task = Tasks.get_task!(id)
    {:ok, _} = Tasks.delete_task(task)

    {:noreply,
     socket
     |> put_flash(:info, "Tarefa removida!")
     |> assign(:tasks, Tasks.list_tasks())}
  end

  defp task_item(assigns) do
    ~H"""
    <div class="group flex items-center justify-between p-4 bg-white border border-slate-100 rounded-xl shadow-sm hover:shadow-md hover:border-indigo-100 transition-all duration-300">
      <div class="flex items-center gap-4 flex-1">
        <div class="h-8 w-8 rounded-full bg-slate-50 flex items-center justify-center text-slate-400 group-hover:bg-indigo-50 group-hover:text-indigo-500 transition-colors">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
          </svg>
        </div>
        <span class="text-slate-700 font-medium group-hover:text-slate-900 transition-colors">
          {@task.title}
        </span>
      </div>

      <div class="flex items-center gap-2 opacity-0 group-hover:opacity-100 transition-opacity">
        <.button
          variant={:danger}
          phx-click="delete"
          phx-value-id={@task.id}
          data-confirm="Têm certeza que quer excluir?"
          class="p-2 h-auto"
        >
          <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16" />
          </svg>
        </.button>
      </div>
    </div>
    """
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset)
    can_submit? = changeset.valid? and Ecto.Changeset.get_field(changeset, :title) != nil

    socket
    |> assign(:form, form)
    |> assign(:can_submit?, can_submit?)
  end
end
