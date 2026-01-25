{ userName, userEmail }:
{
  enable = true;
  settings = {
    user = {
      name = userName;
      email = userEmail;
    };
    core = {
      editor = "nvim";
    };
    color = {
      ui = true;
    };
    push = {
      default = "simple";
    };
    pull = {
      ff = "only";
    };
    init = {
      defaultBranch = "main";
    };
  };
  ignores = [
    ".DS_Store"
  ];
}
