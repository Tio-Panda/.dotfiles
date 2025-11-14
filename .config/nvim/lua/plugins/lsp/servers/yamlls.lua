return {
	settings = {
		yaml = {
			schemaStore = {
				enable = false, -- Disable built-in schemaStore support, and use SchemaStore.nvim instead.
				url = "", -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
			},
			-- schemas = require('schemastore').yaml.schemas(),
		},
	},
}
