#include <stddef.h>

#include "mujoco/mjui.h"

int offset_of_mjuiitem() {
	return offsetof(struct mjuiItem_, single);
}
