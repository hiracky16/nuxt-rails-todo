module Mutations
  class CreateTask < GraphQL::Schema::RelayClassicMutation
    # TODO: define return fields
    # field :post, Types::PostType, null: false

    # TODO: define arguments
    # argument :name, String, required: true

    # TODO: define resolve method
    # def resolve(name:)
    #   { post: ... }
    # end
		graphql_name 'CreateTask'

		field :task, Types::TaskType, null: true
		field :result, Boolean, null: true

		argument :name, String, required: false
		argument :description, String, required: false

		def resolve(**args)
      task = Task.create(
        name: args[:name],
        description: args[:description],
        completed: false
      )
      {
        task: task,
        result: task.errors.blank?
      }
    end
  end
end
