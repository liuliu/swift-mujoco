#include <stddef.h>

#include "mujoco/mjui.h"

int offsetAnonymousUnionOfMjuiItem() {
	return offsetof(struct mjuiItem_, single);
}
