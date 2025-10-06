import py_compile
import os

def compile_to_pyc(source_file, output_dir, output_name=None):
    """
    Compile a .py file into .pyc and store it in a custom directory.

    :param source_file: Path to the Python source file (.py)
    :param output_dir: Directory where .pyc should be stored
    :param output_name: Optional name for the compiled file (default: same as source with .pyc)
    """
    os.makedirs(output_dir, exist_ok=True)

    if output_name is None:
        output_name = os.path.splitext(os.path.basename(source_file))[0] + ".pyc"

    output_path = os.path.join(output_dir, output_name)

    py_compile.compile(source_file, cfile=output_path)
    print(f"✅ Compiled: {source_file} → {output_path}")


# Your case
compile_to_pyc(
    "D:/Product/Infraon/infraon_api/app/logmanagement/log_integration/controllers.py",
    "D:/compiled/",
    "controllers.pyc"
)
