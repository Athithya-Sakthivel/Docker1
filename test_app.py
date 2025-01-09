import unittest
import numpy as np
from app import CustomLinearModel
from model.metrics import MSE
from model.gradients import MSE_grad

class TestCustomLinearModel(unittest.TestCase):
    def test_training(self):
        X = np.random.rand(50, 2)
        y = np.random.rand(50)
        model = CustomLinearModel(dim=X.shape[1], is_reg=True, loss_fn=MSE, grad_fn=MSE_grad)
        model.fit(X, y, lr=0.01, n_iteration=10)
        self.assertIsNotNone(model.get_weight())
        self.assertTrue(len(model.train_losses) > 0)
