const todoList = [];



function addTodo() {
    const todoDescription = {
        name: '',
        date: ''
    };
    const inputElement = document.querySelector('.js-todo-input');
    const dateElement = document.querySelector('.js-todo-date');
    todoDescription.name = inputElement.value.trim();
    todoDescription.date = dateElement.value.trim();
    todoList.push(todoDescription);
    inputElement.value = '';
    dateElement.value = ''; // this will make the input field empty after adding a todo

};

function displayTodo() {

    let todoListHtml = '';
    for (let i = 0; i < todoList.length; i++) {
        const todoItem = todoList[i];
        const html = `
        <div>${todoItem.name} 
        </div> 
        <div>${todoItem.date}
        </div> 
        <button onclick =" 
            todoList.splice(${i},1); 
            displayTodo();
        ">Delete</button>
        `
        todoListHtml += html;
    }

    document.querySelector('.js-todoList').innerHTML = todoListHtml;
}



