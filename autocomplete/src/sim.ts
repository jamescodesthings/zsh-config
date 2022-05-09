const completionSpec: Fig.Spec = {
  name: "sim",
  description: "Manipulates the running ios simulator",
  subcommands: [
    {
      name: "set-clock",
      description: "Set the simulator clock to the given value",
      args: {
        name: "time",
        description: "the time in HH:MM that you want to set",
      },
    },
    {
      name: "screenshot",
      description: "Saves a screenshot at path.png",
      args: {
        name: "path.png",
        description: "the path to save the screenshot to",
      },
    },
    {
      name: "screenrecord",
      description: "Saves a screen recording at path.mov",
      args: {
        name: "path.mov",
        description: "the path to save the recording to",
      },
    },
    {
      name: "install",
      description: "Installs a local .app file",
      args: {
        name: "path.app",
        description: "the path to the app to install",
      },
    },
  ],
};
export default completionSpec;
