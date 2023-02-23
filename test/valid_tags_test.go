package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/terraform"
	test_structure "github.com/gruntwork-io/terratest/modules/test-structure"
	"github.com/stretchr/testify/assert"
)

func TestValidTags(t *testing.T) {
	t.Parallel()

	workingDir := "../examples/valid-tags"

	stage := test_structure.RunTestStage

	defer stage(t, "cleanup", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

		terraform.Destroy(t, terraformOptions)
	})

	stage(t, "init", func() {
		terraformOptions := &terraform.Options{
			TerraformDir: workingDir,
		}

		test_structure.SaveTerraformOptions(t, workingDir, terraformOptions)

		terraform.Init(t, terraformOptions)
	})

	stage(t, "deploy", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

		terraform.Plan(t, terraformOptions)
		terraform.ApplyAndIdempotent(t, terraformOptions)
	})

	stage(t, "validate", func() {
		terraformOptions := test_structure.LoadTerraformOptions(t, workingDir)

		tags := terraform.OutputMap(t, terraformOptions, "tags")

		assert.Contains(t, tags, "created-by", "The 'tags' output should contain the 'created-by' key.")
		assert.Contains(t, tags, "environment", "The 'tags' output should contain the 'environment' key.")
		assert.Contains(t, tags, "owner", "The 'tags' output should contain the 'owner' key.")
		assert.Contains(t, tags, "service", "The 'tags' output should contain the 'service' key.")
		assert.Contains(t, tags, "extra", "The 'tags' output should contain the 'extra' key.")
		assert.Contains(t, tags, "key-with-dash", "The 'tags' output should contain the 'key-with-dash' key.")
		assert.Contains(t, tags, "key-with-1-number", "The 'tags' output should contain the 'key-with-1-number' key.")
		assert.Contains(t, tags, "key-with-trailing-number1", "The 'tags' output should contain the 'key-with-trailing-number1' key.")
	})
}
