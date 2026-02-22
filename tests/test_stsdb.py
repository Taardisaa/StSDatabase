import json
import subprocess
import sys
import unittest

import stsdb


class StsdbApiTests(unittest.TestCase):
    def test_module_exports_query_functions(self):
        self.assertTrue(callable(stsdb.query_card))
        self.assertTrue(callable(stsdb.query_relic))

    def test_query_card_found(self):
        result = stsdb.query_card("Bash")
        self.assertTrue(result["found"])
        self.assertEqual(result["entry"]["name"], "Bash")

    def test_query_card_is_exact_match(self):
        result = stsdb.query_card("bash")
        self.assertFalse(result["found"])
        self.assertEqual(result["error"], "CARD_NOT_FOUND")

    def test_query_card_single_upgrade_cap(self):
        result = stsdb.query_card("Bash", upgrade_times=5)
        self.assertTrue(result["found"])
        self.assertEqual(result["entry"]["applied_upgrade_times"], 1)
        self.assertEqual(result["entry"]["description"], "Deal 10 damage. Apply 3 Vulnerable.")

    def test_query_card_searing_blow_multi_upgrade(self):
        result = stsdb.query_card("Searing Blow", upgrade_times=3)
        self.assertTrue(result["found"])
        self.assertEqual(result["entry"]["description"], "Deal 27 damage. Can be Upgraded any number of times.")
        self.assertEqual(result["entry"]["applied_upgrade_times"], 3)
        self.assertEqual(result["entry"]["max_upgrade_times"], -1)

    def test_query_card_invalid_upgrade_input(self):
        result = stsdb.query_card("Bash", upgrade_times=-1)
        self.assertFalse(result["found"])
        self.assertEqual(result["error"], "INVALID_UPGRADE_TIMES")

    def test_query_relic_found(self):
        result = stsdb.query_relic("Burning Blood")
        self.assertTrue(result["found"])
        self.assertEqual(result["entry"]["name"], "Burning Blood")

    def test_query_relic_miss(self):
        result = stsdb.query_relic("burning blood")
        self.assertFalse(result["found"])
        self.assertEqual(result["error"], "RELIC_NOT_FOUND")


class StsdbCliTests(unittest.TestCase):
    def test_module_cli_query_card(self):
        process = subprocess.run(
            [sys.executable, "-m", "stsdb", "query_card", "Bash"],
            check=True,
            capture_output=True,
            text=True,
        )
        payload = json.loads(process.stdout)
        self.assertTrue(payload["found"])
        self.assertEqual(payload["entry"]["name"], "Bash")


if __name__ == "__main__":
    unittest.main()
