function create_dialog(messages){
    // If a dialog instance already exists, return it
    var existing = instance_find(obj_dialog, 0);
    if (existing != noone) return existing;

    // Create and initialize a dialog instance
    var inst = instance_create_depth(0, 0, 0, obj_dialog);
    inst.messages = messages ? messages : [];
    inst.current_message = 0;
    return inst;
}

welcome_dialog = [
{
    name: "Cross",
    msg: "Welcome to the pit."
},

{
    name: "Singh",
    msg: "Thanks!"
},

{
    name: "Cross",
    msg: "Well, it's a cave, but I like to call it the pit."
},

{
    name: "Singh",
    msg: "Okay..."
},

{
    name: "Cross",
    msg: "Can you make it to the end?"
}
]
