pragma solidity ^0.8.7;


contract TodoList {
    //0x4574c5445104d8D730245C055f483ba082894aE5: rinkeby address
    struct Todo {
        string text;
        bool completed;
    }
    Todo[] public todos;
    function create(string calldata _text) external {
        todos.push(Todo({
            text: _text,
            completed: false
        }));
    }

    function updateText(uint _index, string calldata _text) external {
        Todo storage todo = todos[_index];
        todo.text = _text;
    }

    function get(uint _index) external view returns(string memory, bool) {
        Todo memory todo = todos[_index];
        return (todo.text, todo.completed);
    }
    function toggleCompleted(uint _index) external {
        todos[_index].completed = !todos[_index].completed;
    }
}