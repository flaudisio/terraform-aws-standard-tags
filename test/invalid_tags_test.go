package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestInvalidTags(t *testing.T) {
	t.Parallel()

	workingDir := "../examples/invalid-tags"

	stage := test_structure.RunTestStage

	stage(t, "init", func() {
		terraformOptions := &terraform.Options{
			TerraformDir: workingDir,
		}

		test_structure.SaveTerraformOptions(t, workingDir, terraformOptions)

		terraform.Init(t, terraformOptions)
	})

	stage(t, "deploy", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

		_, err := terraform.PlanE(t, terraformOptions)

		assert.Error(t, err, "The 'plan' command should return an error.")
	})
}
