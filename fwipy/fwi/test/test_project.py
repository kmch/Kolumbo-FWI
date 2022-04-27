import numpy as np
import os
from unittest import TestCase

import fwipy
from fwipy.fwi.project import Project

test_dir = os.path.dirname(fwipy.fwi.test.__file__)

class TestSynthetic(TestCase):
  def test_init(self):
    p = Project(name='test_init', path=test_dir)
    p.init()
    print(p.params.all)