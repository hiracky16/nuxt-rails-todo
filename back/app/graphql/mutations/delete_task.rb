module Mutations
  class DeleteTask < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
		graphql_name 'DeleteTask'

		field :task, Types::TaskType, null: true
    field :result, Boolean, null: true

		argument :id, ID, required: true

		def resolve(**args)
      task = Task.find(args[:id])
      task.destroy
      {
        task: task
      }
    end
  end
end
