module Mutations
  class UpdateTask < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
		graphql_name 'UpdateTask'

		field :task, Types::TaskType, null: true
    field :result, Boolean, null: true

		argument :id, ID, required: true
    argument :completed, Boolean, required: true

		def resolve(**args)
      task = Task.find(args[:id])
      task.update(completed: args[:completed])
      {
        task: task,
        result: task.errors.blank?
      }
    end
  end
end
