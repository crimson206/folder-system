# Crimson Folder System

A Python library for easy file and folder searching, filtering, and deletion.

## Installation

```bash
pip install crimson-folder-system
```

## Features

- **File and Folder Search**: Quickly search for files and folders using pattern matching
- **Various Filtering Options**: Filter using regular expressions (RegEx) or fnmatch patterns
- **Content Search**: Search and filter based on file contents
- **Path Processing**: Path slicing and manipulation utilities
- **File Deletion**: Safe file deletion capabilities

## Usage Examples

### Search for Files and Folders

```python
from crimson.folder_system import FnFilter, search, ReFilter

# Search using fnmatch patterns
results = search(
    '../', 
    filter_obj=FnFilter(
        include=['*src*'],
        exclude=['*__pycache__*', '*.git*', '*egg-info*']
    ), 
    targets=['folder', 'path']
)

# Search using regular expressions
results = search(
    '../',
    filter_obj=ReFilter(
        include=['.ipynb'],
        exclude=['.git', '__pycache__', 'egg-info']
    ), 
    targets=['path']
)
```

### Search by File Content

```python
from crimson.folder_system.search import filter_files_by_content
from crimson.folder_system.filter import ReFilter

# Find files containing specific content
results = filter_files_by_content(
    base_root="../src",
    path_filter=ReFilter(exclude=['egg-info']),
    content_filter=ReFilter(include=["class Filter"])
)
```

### Path Slicing

```python
from crimson.folder_system.path import get_sliced_path

path = "/home/crimson/manager/crimson/folder-system/example/path.ipynb"
sliced_path = get_sliced_path(path, 2, -2)  # 'crimson/manager/crimson/folder-system'
```

### File Deletion

```python
from crimson.folder_system import delete_files

result = delete_files(file_paths)
# Result: {'success': [...successful deletions...], 'failed': {...failed deletions with reasons...}}
```

## Filter Types

1. **FnFilter**: fnmatch pattern-based filtering (supports wildcards)
2. **ReFilter**: Regular expression-based filtering

## Creating Custom Filters

```python
from crimson.folder_system.filter import Filter
from typing import List

class MyCustomFilter(Filter):
    def filter(self, paths: List[str]) -> List[str]:
        # Implement your own filtering logic
        return [path for path in paths if your_condition(path)]
```

## License

MIT

## Contact

GitHub: [https://github.com/crimson206/folder-system](https://github.com/crimson206/folder-system)