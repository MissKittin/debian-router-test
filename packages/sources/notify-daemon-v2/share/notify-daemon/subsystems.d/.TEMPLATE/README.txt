Use this template to build own subsystem.

Everything outside subsystem__YOURSUBSYSTEM() will be executed during the import. Remember that other functions
used in your code may not be defined at this point.
subsystem__YOURSUBSYSTEM() will be executed after all enabled subsystems are imported - at this point you are sure
that all the functions used are defined and ready to use.
