#include "DrawingEngine.h"

DrawingEngine::DrawingEngine(any widthI, any heightI) : ClassFactory() {
    if (!setVar(width, widthI, "width") || !setVar(height, heightI, "height")) {
        setNotCorrected();
    }
}

