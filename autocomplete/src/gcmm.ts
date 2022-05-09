const completionSpec: Fig.Spec = {
  name: "gcmm",
  description: "Commits with a common prefix",
  subcommands: [
    {
      name: "set-project",
      description: "Sets the project for this branch",
      args: {
        name: "project",
        description: "The project to attribute this branch to",
      },
    },
    {
      name: "get-project",
      description: "Gets the project for this branch",
    },
    {
      name: "unset-project",
      description: "Unsets the project for this branch",
    },
    {
      name: "show",
      description: "Shows the full commit prefix",
    },
  ],
  // Only uncomment if gcmm takes an argument
  args: {
    name: "message",
    description: "The message to commit",
    isOptional: true,
  },
};
export default completionSpec;
