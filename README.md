## Projects & Workshops Overview

### 1. Website Boilerplate Creation
A foundational workshop focusing on terminal navigation, file system manipulation, and automation using Bash commands (`mkdir`, `touch`, `mv`, `rm`, `cp`) to build a standard web project structure[cite: 6].
* **Directory Structure**:
  * `src/`: Core website logic containing `index.html`, `index.js`, and `styles.css`[cite: 6].
  * `assets/`: Media and static resources categorized into subdirectories[cite: 6]:
    * `fonts/`: Typography assets (`.ttf`, `.woff`)[cite: 6].
    * `icons/`: Vector and UI icons (`.svg`)[cite: 6].
    * `images/`: Raster image files (`.jpg`, `.jpeg`, `.png`)[cite: 6].
* **Key Skills Practiced**: Relative and absolute directory navigation, nested folder generation, file extension/format refactoring, and directory restructuring.

---

### 2. Five Bash Programs
A suite of interactive command-line scripts designed to demonstrate core scripting concepts, including user input processing, loop structures, conditionals, arithmetic evaluation, and modular script execution.

* **`questionnaire.sh`**: Captures user input interactively via `read` prompts and outputs formatted variable strings[cite: 10].
* **`countdown.sh`**: Uses argument handling (`$1`) with input validation and a decremental `while` loop paired with `sleep 1` intervals[cite: 8].
* **`bingo.sh`**: Generates a pseudo-random integer (`1–75`) using `$RANDOM` and classifies the output into standard Bingo columns (`B`, `I`, `N`, `G`, `O`) via multi-branch conditional evaluations (`if`/`elif`/`else`)[cite: 9].
* **`fortune.sh`**: Utilizes reusable function declarations, array indexing, and regular expression validation within an `until` loop (`\?$`) to enforce question formatting[cite: 7].
* **`five.sh`**: Acts as a central controller orchestrating sequential execution of all four child programs with positional parameters[cite: 11].

---

### 3. Mario Database (PostgreSQL)
A relational database designed to track Nintendo characters, physical traits, sound clips, and action capabilities[cite: 6].

#### Schema & Architecture
* **`characters`**: Primary character entity storing identification, name, homeland, and signature color[cite: 6].
* **`more_info`**: Represents a **One-to-One (1:1)** relationship with `characters` using a unique foreign key constraint (`character_id UNIQUE`) to store biological and physical metrics (birthday, height, weight)[cite: 6].
* **`sounds`**: Implements a **One-to-Many (1:N)** relationship linking multiple audio assets (e.g., `its-a-me.wav`, `yahoo.wav`) to specific character entities[cite: 6].
* **`actions` & `character_actions`**: Implements a **Many-to-Many (N:M)** relationship between characters and available moves (`run`, `jump`, `duck`) using a composite primary key (`PRIMARY KEY (character_id, action_id)`) on the junction table[cite: 6].

#### SQL & Modeling Skills
* DDL constraint enforcement: `PRIMARY KEY`, `FOREIGN KEY ... REFERENCES`, `UNIQUE`, and `NOT NULL`[cite: 6].
* Sequence generation and `SERIAL`-equivalent auto-incrementing integer keys[cite: 6].
* Data integrity types including `numeric(4,1)`, `date`, `varchar`, and nullability handling[cite: 6].
