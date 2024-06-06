#include "Cli.h"

Cli::Cli(any widthI, any heightI, any wallI, any routeI) : DrawingEngine(widthI, heightI) {
    writeToLogs("CLI created");
    if (!checkIfCorrect() || !setVar<char>(wall, wallI, "wall") || !setVar<char>(route, routeI, "route")) {
        setNotCorrected();
    }
}

void Cli::print(vector<vector<int>> grid) {
    for (int v = 0; v < getVar<int>("height"); v++) {
        for (int i = 0; i < getVar<int>("width"); ++i) {
            char toPrint = (grid[v][i] == 0) ? getVar<char>("route") : getVar<char>("wall");
            cout << toPrint;
        }
        cout << endl;
    }
}

