# test_api_tool.py
import unittest
from api_tool import fetch_card_data  # or whatever function you're testing

class TestApiTool(unittest.TestCase):
    def test_fetch_card_data_valid(self):
        result = fetch_card_data("Michael Jordan rookie card")
        self.assertIsInstance(result, dict)
        self.assertIn("price", result)

    def test_fetch_card_data_empty(self):
        result = fetch_card_data("")
        self.assertEqual(result, {})

if __name__ == "__main__":
    unittest.main()
