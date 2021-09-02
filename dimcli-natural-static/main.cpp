#include "dimcli/cli.h"
#include <iostream>
#include <sysexits.h>

using namespace std;

static auto & yell = Dim::Cli().opt<bool>("yell.").desc("Say it loud.");
static auto & command = Dim::Cli().command("apple").desc("Change color of the apple.");
static auto & color = command.opt<string>("color", "red");

bool apple(Dim::Cli & cli) {
    cout << "It's a " << *color << " apple" << (*yell ? "!!!" : ".");
    return true;
}

int orange(Dim::Cli & cli) {
    cout << "It's an orange" << (*yell ? "!!!" : ".");
    return EX_OK;
}

int main(int argc, char * argv[]) {
    Dim::Cli cli;
    cli.command("apple").desc("Show apple. No other fruit.").action(apple);
    cli.command("orange").desc("Show orange.").action(orange);
    return cli.exec(cerr, argc, argv);
}
