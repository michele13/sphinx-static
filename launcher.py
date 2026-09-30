import sys
from pathlib import Path

from sphinx.cmd.build import main as build_main
from sphinx.cmd.quickstart import main as quickstart_main
from sphinx_autobuild.__main__ import main as autobuild_main


def main():
    executable = Path(sys.argv[0]).name

    """
     Busybox-like behavior. if this executable is called:
     - sphinx-build
     - sphinx-quickstart
     - sphinx-autobuild
     
     call it
    """

    if executable == "sphinx-build":
        return build_main()

    if executable == "sphinx-quickstart":
        return quickstart_main()

    if executable == "sphinx-autobuild":
        return autobuild_main()

    """
    sphinx-autobuild internally invokes:
    sys.executable -m sphinx build ...
    In a normal install sys.executable is python, but 
    With PyInstaller executable, sys.executable points back to this executable.
    """
    

    if len(sys.argv) >= 4 and sys.argv[1:4] == ["-m", "sphinx", "build"]:
        sys.argv = [sys.argv[0]] + sys.argv[4:]
        return build_main()

    # ------------------------------------------------------------
    # Our unified interface:
    #
    #   sphinx build ...
    #   sphinx quickstart ...
    #   sphinx autobuild ...
    # ------------------------------------------------------------

    if len(sys.argv) < 2:
        print("usage: sphinx {build|quickstart|autobuild} ...")
        return 1

    command = sys.argv.pop(1)

    if command == "build":
        return build_main()

    if command == "quickstart":
        return quickstart_main()

    if command == "autobuild":
        return autobuild_main()

    print(f"unknown command: {command}")
    return 1


if __name__ == "__main__":
    raise SystemExit(main())